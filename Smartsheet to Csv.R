## smart sheet import function

#sheet ID 4701405874284420,
#API Key = "GxrvfnkIi07vvAAk775hUigIcFeQC7dxUzyj7"


get_smartsheet <- function(sheetid, apikey) {
  authstring <- stringr::str_glue("Bearer {apikey}")
  urlstring <- stringr::str_glue('https://api.smartsheet.com/2.0/sheets/{sheetid}')
  
  h <- curl::new_handle()
  curl::handle_setheaders(h,
                          "Authorization" = authstring,
                          "Accept" = "text/csv")
  
  tmp <- tempfile()
  curl::curl_download(urlstring, destfile = tmp, handle = h)
  rawdata <- readr::read_csv(tmp, show_col_types = FALSE)
}
