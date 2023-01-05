abstract class FutureUsecase<Output, Input> {
  Future<Output> run(Input input);
}

abstract class FutureOutputUsecase<Output> {
  Future<Output> run();
}
