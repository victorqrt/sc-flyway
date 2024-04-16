import cats.effect._
import fly4s._
import fly4s.data._


object FWTest extends IOApp:

  def run(args: List[String]) =
    Fly4s
      .make[IO]
        ( url = "jdbc:sqlite:test.db"
        , user = None
        , password = None
        , config = Fly4sConfig(locations = Locations("classpath:sql")))
      .use(_.migrate)
      .as(ExitCode.Success)
