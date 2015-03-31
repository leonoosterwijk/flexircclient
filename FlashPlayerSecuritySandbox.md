#security sandbox violation explanation.

# Introduction #

If you try to access an IRC server from the flexircclient loaded over http from a server in a different domain you might get a "Security sandbox violation". Flash Player was designed with a strong security model and it disallows you from making contact with a server that is not the original source of the SWF.


# Details #
By default Flash Player will not allow a SWF loaded from one domain to access data on a different domain. There are a couple of options to work around this:

  1. Load the SWF from your local file system. (not over http) This way you have full access to access any domain
  1. Put the SWF on the domain to which you're trying to connect (this is probably not feasible if you are connecting to a third party server)
  1. Ask the operator of IRC server to place a crossdomain.xml file on the IRC server
  1. Use a proxy on your web server which will connect to the IRC server on behalf of the Flash client

# Resources #
Adobe has some resources on Flash Security restrictions:

**http://kb.adobe.com/selfservice/viewContent.do?externalId=tn_16520&sliceId=2**

**http://kb.adobe.com/selfservice/viewContent.do?externalId=tn_14213&sliceId=1**








