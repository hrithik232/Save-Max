import 'dart:async';

/// The Delay operator modifies its source Observable by pausing for
/// a particular increment of time (that you specify) before emitting
/// each of the source Observable’s items.
/// This has the effect of shifting the entire sequence of items emitted
/// by the Observable forward in time by that specified increment.
///
/// [Interactive marble diagram](http://rxmarbles.com/#delay)
///
/// ### Example
///
///     new Observable.fromIterable([1, 2, 3, 4])
///       .delay(new Duration(seconds: 1))
///       .listen(print); // [after one second delay] prints 1, 2, 3, 4 immediately
class DelayStreamTransformer<T> extends StreamTransformerBase<T, T> {
  final StreamTransformer<T, T> _transformer;

  /// Constructs a [StreamTransformer] which will first pause for [duration] of time,
  /// before submitting events from the source [Stream].
  DelayStreamTransformer(Duration duration)
      : _transformer = _buildTransformer(duration);

  @override
  Stream<T> bind(Stream<T> stream) => _transformer.bind(stream);

  static StreamTransformer<T, T> _buildTransformer<T>(Duration duration) {
    return StreamTransformer<T, T>((Stream<T> input, bool cancelOnError) {
      var onDoneCalled = false, hasNoEvents = true;
      var timers = <Timer>[];
      StreamController<T> controller;
      StreamSubscription<T> subscription;

      controller = StreamController<T>(
          sync: true,
          onListen: () {
            subscription = input.listen(
                (value) {
                  hasNoEvents = false;

                  try {
                    Timer timer;
                    timer = Timer(duration, () {
                      controller.add(value);

                      timers.remove(timer);

                      if (onDoneCalled && timers.isEmpty) {
                        controller.close();
                      }
                    });

                    timers.add(timer);
                  } catch (e, s) {
                    controller.addError(e, s);
                  }
                },
                onError: controller.addError,
                onDone: () {
                  if (hasNoEvents) controller.close();

                  onDoneCalled = true;
                },
                cancelOnError: cancelOnError);
          },
          onPause: ([Future<dynamic> resumeSignal]) =>
              subscription.pause(resumeSignal),
          onResume: () => subscription.resume(),
          onCancel: () {
            timers.forEach(_cancelTimerIfActive);

            return subscription.cancel();
          });

      return controller.stream.listen(null);
    });
  }

  static void _cancelTimerIfActive(Timer _timer) {
    if (_timer != null && _timer.isActive) {
      _timer.cancel();
    }
  }
}
