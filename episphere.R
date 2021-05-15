
#' epiSphere data platform
#' 
#' initialize epiSphere's data platform by loading and logging into Box.com
#' @param none, box authentication is started by default
#' @keywords episphere, dceg, box.com
#' @export
#' @examples 
#' connect()

connect <- function(){
  # ini
  # info on packaging at https://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/
  # followed by /Library/Frameworks/R.framework/Resources/R CMD build episphere
  # check gz with /Library/Frameworks/R.framework/Resources/R CMD check --as-cran
  requirePkj(c("boxr"))  # use collection for multiple libraries
  box_auth("627lww8un9twnoa8f9rjvldf7kb56q1m","gSKdYKLd65aQpZGrq9x4QVUNnn5C8qqm")
}

#' Check packages
#' 
#' @param name of package, as a string or a collection of strings
#' @export

requirePkj <- function(pkj){
  if(typeof(pkj)=="character"){pkj=c(pkj)}
  lapply(
    pkj,
    FUN = function(x) {
      if (!require(x, character.only = TRUE)) {
        install.packages(x, dependencies = TRUE)
        library(x, character.only = TRUE)
      }
    }
  )
}

#' opens browser with url
#' @param url
#' @export

openURL <- function(url="https://episphere.github.io/r"){
  utils::browseURL(url)
}

#' opens browser with url
#' @param folder id
#' @export

openFolder <- function(id=133596945131){
  openURL(paste("https://nih.app.box.com/folder/",id,sep=""))
  message(paste("folder #",id," opened in your browser",sep=""))
}

#' opens file in browser with box file id
#' @param file id, version id
#' @export

openFile <- function(id=787813783402,ver=NULL){
  url=paste("https://nih.app.box.com/file/",id,sep="")
  if(typeof(NULL)!="NULL"){
    url=paste(url,"?sb=/details/versions/",ver,sep="")
  }
  message(paste("browser tab opened at",url))
  openURL(url)
  # for example of a specific version, openFile(787813783402,841936237402)
}

#' wrapper for box_read, under development
#' @param file id, version id
#' @export

read <- function(id=787813783402,ver=NULL){
  box_read(file_id=id,version_id=ver)
}

connect()