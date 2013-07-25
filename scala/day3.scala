// Tyler Palsulich
// Seven Languages in Seven Weeks, by Bruce A. Tate
// Scala Day 2

// Take the sizer application and add a message to count the number
// of links on the page.

// Bonus problem: Make the sizer follow the links on a given page,
// and load them as well. For example, a sizer for “google.com” would
// compute the size for Google and all of the pages it links to.

import scala.io._
import scala.actors._
import Actor._
import java.nio.charset.MalformedInputException

object PageLoader {


	val encodings = List("ISO-8859-15", "UTF-8")

	def load(url: String):String = {
		for(enc <- encodings) {
			try { 
				return Source.fromURL(url, enc).mkString
			} 
			catch { 
				case e: MalformedInputException =>
				println("Malformed input [" + url + "]: " + enc)
			}
		}
		return ""
	}
	def loadPage(url: String) = load(url)
	def getPageSize(page: String) = page.length
	def getPageLinks(page: String) = {
		val pattern = "(?i)<a.+?href=\"(http.+?)\".*?>(.+?)</a>".r
		val links = (pattern.findAllIn(page)).matchData.toList.map(_.group(1))
		links
	}
	def getLinksSizes(size: Int, links: List[String]): Int = links match {
		case Nil => size
		case head :: tail => getLinksSizes(size + PageLoader.getPageSize(PageLoader.loadPage(head)), tail)  
	}

}
val urls = List("http://www.google.com/")
def timeMethod(method: () => Unit) = {
	val start = System.nanoTime
	method()
	val end = System.nanoTime
	println("Method took " + (end - start)/1000000000.0 + " seconds." )
}
def printInfo(url: String, size: Int, links: Int, linksSizes: Int){
	println("Info for " + url + ": size=" + size + ", links=" + links + ", links total size=" + linksSizes)
}
def getPageSizeSequentially() = {
	for(url <- urls) {
		val page = PageLoader.loadPage(url)
		val size = PageLoader.getPageSize(page)
		val links = PageLoader.getPageLinks(page)
		val linksSizes = PageLoader.getLinksSizes(0, links)
		printInfo(url, size, links.length, linksSizes)
	}
}

def getPageSizeConcurrently() = {
	val caller = self
	for(url <- urls) {
		actor {
			val page = PageLoader.loadPage(url)
			val links = PageLoader.getPageLinks(page)
			caller ! ((url, PageLoader.getPageSize(page), links, PageLoader.getLinksSizes(0, links)))
		}
	}
	for(i <- 1 to urls.size) {
		receive {
			case (url: String, size: Int, links: List[String], linksSizes: Int) => {
				printInfo(url, size, links.length, linksSizes)
			}
			
		}
	}
}

println("Sequential run:" )
timeMethod { getPageSizeSequentially }
println("Concurrent run:" )
timeMethod { getPageSizeConcurrently }