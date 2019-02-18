package aoc2018

import scala.io.Source

object day01 {

  def getInput(): List[Int] = {
    val filename = "resources/day01_input.txt"
    Source.fromFile(filename).getLines().map(in => in.toInt).toList
  }

  def result1(): Int = {
    val inputList = getInput()
    val result = inputList.sum//.foldLeft(0)(_ + _)
    println(s"RESULT IS = $result")
    result
  }

  def result2():Int = {
    val inputList = getInput()
    def innerFind(current: Int = 0, intset: Set[Int] = Set(), intlist: List[Int] = inputList): Int = {
      if ( intset.contains(current) ) {
        current
      } else {
        intlist match {
          case head :: tail =>
            innerFind(current + head, intset + current, tail)
          case _ =>
            innerFind(current, intset, inputList)
        }
      }
    }
    val result2 = innerFind()
    println(s"RESULT 2 IS = $result2")
    result2
  }

}
