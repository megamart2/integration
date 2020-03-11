before(): call($ foo$(...)) {
	printf("aspect 1: before call %s from %s \n", this->targetName, this->funcName);
}

before(): call($ printf$(...)) {
	printf("aspect 2: before call %s from %s \n", this->targetName, this->funcName);
}

