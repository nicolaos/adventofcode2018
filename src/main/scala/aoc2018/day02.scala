package aoc2018

import scala.annotation.tailrec
import scala.io.Source

object day02 {

  def getInput(): List[String] = {
    val filename = "resources/day02_input.txt"
    Source.fromFile(filename).getLines().toList
  }

  def result1(): Int = {
    val inputList = getInput()
    val withTwo = inputList.foldLeft(0){ (acc, value) => acc + exactlyTwo(value) }
    val withThree = inputList.foldLeft(0){ (acc, value) => acc + exactlyThree(value) }
    println(s"$withTwo")
    println(s"$withThree")
    withTwo * withThree
  }

  def exactlyTwo(id: String): Int = {
    val setSizes = id.groupBy(char => char).map(v => (v._1, v._2.size)).foldLeft(Set[Int]()) { (acc, value) => acc + value._2 }
    if ( setSizes.contains(2) )
      1
    else
      0
  }

  def exactlyThree(id: String): Int = {
    val setSizes = id.groupBy(char => char).map(v => (v._1, v._2.size)).foldLeft(Set[Int]()) { (acc, value) => acc + value._2 }
    if ( setSizes.contains(3) )
      1
    else
      0
  }

  /* part 2 solution */
  @tailrec
  def solve2(index: Int = 0): String = {
    def helper(index: Int = index, input: List[String] = getInput) =
      input
        .map { l =>
          new StringBuilder(l).deleteCharAt(index).toString
        }
        .groupBy { l =>
          l
        }
        .map { p =>
          (p._1, p._2.size)
        }
        .filter { p =>
          p._2 > 1
        }

    val map = helper()
    val size = map.size
    size match {
      case 0 => solve2(index + 1)
      case 1 => map.toIterator.next._1
      case _ => sys.error(s"invalid solution: $map")
    }
  }

  def main(args: Array[String]): Unit = {
    println(s"result1 = ${result1()}")

    println(s"result1 = ${solve2()}")
  }



}
