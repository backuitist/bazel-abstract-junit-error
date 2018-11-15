package test

import org.junit.{Assert, Test}
abstract class TestBase {

  @Test
  def sayHello(): Unit = {
    Assert.assertEquals("bla", "bli")
  }
}