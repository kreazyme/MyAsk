abstract class FutureUsecase<Output, Input> {
  Future<Output> run(Input input);
}

abstract class FutureOutputUsecase<Output> {
  Future<Output> run();
}

abstract class FutureInputUsecase<Input> {
  Future<void> run(Input input);
}

abstract class FutureVoidUsecase {
  Future<void> run();
}
