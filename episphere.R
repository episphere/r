
episphere <- function(){
  # ini
  episphere.require("boxr")  # use collection for multiple libraries
  box_auth("627lww8un9twnoa8f9rjvldf7kb56q1m","gSKdYKLd65aQpZGrq9x4QVUNnn5C8qqm")
}

episphere.require <- function(pkj){
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

episphere.openURL <- function(url="https://episphere.github.io/r"){
  utils::browseURL(url)
}

episphere()