SCALA_CLI := scala-cli
SOURCES   := $(shell find src -name '*.scala')

define SCALA_DEPS =
//> using scala 3.4.1
//> using resourceDir src/main/resources
//> using repository sonatype:snapshots
//> using dep org.typelevel::cats-effect:3.5.4
//> using dep com.github.geirolz::fly4s-core:1.0.0
//> using dep org.xerial:sqlite-jdbc:3.45.3.0
endef

export SCALA_DEPS


sc-flyway.jar: deps.scala ${SOURCES}
	${SCALA_CLI} --power package . -f -o $@ --assembly


deps.scala: Makefile
	echo "$$SCALA_DEPS" > $@


clean:
	${SCALA_CLI} clean .
	rm -f deps.scala sc-flyway.jar test.db


.PHONY: clean
