#' @title GetChain_R
#' @description sources GetDasChain.py to globalenv, then runs the given stock symbol and option type
#' @param symbol The stock assets market symbol, ex: "AAPL"
#' @param option_type The option type, ("call" or "put")
#' @return Options Chain for given input
#' @details DETAILS
#' @examples GetChain_R("AAPL","call")
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso 
#'  \code{\link[reticulate]{source_python}}
#' @rdname GetChain_R
#' @export 
#' @importFrom reticulate source_python
#' 
 
GetChain_R <- function(symbol,option_type){
  reticulate::source_python("inst/GetDasChain.py")
  chain <- GetDasChain(sym=symbol,typec=option_type)
  Sys.sleep(1)
  print("Downloading chain..")
  Sys.sleep(5)
  return(chain)
}



