% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_resource.R
\name{create_resource}
\alias{create_resource}
\title{Create Resources}
\usage{
create_resource(
  resource,
  id = NULL,
  path = NULL,
  body = list(name = "New"),
  token = NULL,
  on.error = c("stop", "warn", "message"),
  verbose = FALSE,
  handle = NULL,
  encode,
  response
)
}
\arguments{
\item{resource}{Model name, eg. \code{"card"}.}

\item{id}{Model id.}

\item{path}{Path.}

\item{body}{A named list.}

\item{token}{An object of class \code{"Trello_API_token"}, a path or \code{NULL}.
\itemize{
\item If a \code{Token}, it is passed as is.
\item If \code{NULL} and a cache file called \code{".httr-oauth"} exists, the newest token
is read from it. If the file is not found, an error is thrown.
\item If a character vector of length 1, it will be used as an alternative path
to the cache file.
}}

\item{on.error}{Behavior when HTTP status >= 300, defaults to \code{"stop"}.}

\item{verbose}{Whether to pass \code{\link[httr:verbose]{httr::verbose()}} to \code{\link[httr:RETRY]{httr::RETRY()}}.}

\item{handle}{Passed to \code{\link[httr:RETRY]{httr::RETRY()}}.}

\item{encode, response}{Deprecated.}
}
\description{
Create resources via Trello API.
}
\details{
See \href{https://developer.atlassian.com/cloud/trello/rest}{Trello API reference}
for more info about what elements can be included in POST request body.
}
\examples{

\dontrun{

# Get token with write access
key = Sys.getenv("MY_TRELLO_KEY")
secret = Sys.getenv("MY_TRELLO_SECRET")

token = get_token("my_app", key = key, secret = secret,
                  scope = c("read", "write"))

# Get board ID
url = "Your board URL"
bid = get_id_board(url, token)

# Get lists on that board, extract ID of the first one
lid = get_board_lists(bid, token)$id[1]

# Content for the new card
payload = list(
  idList = lid,
  name = "A new card",
  desc = "#This card has been created by trelloR",
  pos = "bottom"
)

# Create card and store the response (to capture the ID
# of the newly created resource)
r = create_resource("card", body = payload, token = token)

# Get ID of the new card
r$id
}
}
\seealso{
Other functions to create resources: 
\code{\link{add_board}()},
\code{\link{add_card}()},
\code{\link{add_checkitem}()},
\code{\link{add_checklist}()},
\code{\link{add_comment}()},
\code{\link{add_label}()},
\code{\link{add_list}()},
\code{\link{add_member}()}
}
\concept{functions to create resources}
