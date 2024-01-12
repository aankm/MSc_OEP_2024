* This is a BPP 4.0 control file !!!

          seed = -1 * -1 means it will use the internal time as seed

       seqfile = ./eurytoma_phylip.txt
      Imapfile = ./eurytoma.Imap.txt
       outfile = bpp_out.txt
      mcmcfile = mcmc.txt

  speciesdelimitation = 1 0 2
  speciestree = 1

speciesmodelprior = 1         * 0: uniform labeled histories; 1:uniform rooted trees; 2:user probs
* maybe change to speciesmodelprior = 3, which can be good for large nr of populations (eg each sample is its own "population")

  species&tree = 96 ZFMK-TIS-2633951  ZFMK-TIS-2633953  ZFMK-TIS-2633954  ZFMK-TIS-2633955  ZFMK-TIS-2633956  ZFMK-TIS-2633958  ZFMK-TIS-2633960  ZFMK-TIS-2633962  ZFMK-TIS-2633964  ZFMK-TIS-2633967  ZFMK-TIS-2633968  ZFMK-TIS-2633970  ZFMK-TIS-2633975  ZFMK-TIS-2633977  ZFMK-TIS-2633983  ZFMK-TIS-2633986  ZFMK-TIS-2633989  ZFMK-TIS-2633990  ZFMK-TIS-2633993  ZFMK-TIS-2633997  ZFMK-TIS-2633999  ZFMK-TIS-2634001  ZFMK-TIS-2634003  ZFMK-TIS-2634007  ZFMK-TIS-2634008  ZFMK-TIS-2634011  ZFMK-TIS-2634012  ZFMK-TIS-2634013  ZFMK-TIS-2634022  ZFMK-TIS-2634024  ZFMK-TIS-2634030  ZFMK-TIS-2634034  ZFMK-TIS-2634035  ZFMK-TIS-2634037  ZFMK-TIS-2634038  ZFMK-TIS-2634042  ZFMK-TIS-2634045  ZFMK-TIS-2634046  ZFMK-TIS-2634047  ZFMK-TIS-2634053  ZFMK-TIS-2634057  ZFMK-TIS-2634061  ZFMK-TIS-2634064  ZFMK-TIS-2634065  ZFMK-TIS-2634066  ZFMK-TIS-2634075  ZFMK-TIS-2634077  ZFMK-TIS-2634078  ZFMK-TIS-2634079  ZFMK-TIS-2634080  ZFMK-TIS-2634084  ZFMK-TIS-2634086  ZFMK-TIS-2634088  ZFMK-TIS-2634089  ZFMK-TIS-2634090  ZFMK-TIS-2634092  ZFMK-TIS-2634096  ZFMK-TIS-2634100  ZFMK-TIS-2634101  ZFMK-TIS-2634102  ZFMK-TIS-2634103  ZFMK-TIS-2634104  ZFMK-TIS-2634105  ZFMK-TIS-2634106  ZFMK-TIS-2634107  ZFMK-TIS-2634108  ZFMK-TIS-2634109  ZFMK-TIS-2634110  ZFMK-TIS-2634111  ZFMK-TIS-2634112  ZFMK-TIS-2634113  ZFMK-TIS-2634114  ZFMK-TIS-2634115  ZFMK-TIS-2634116  ZFMK-TIS-2634117  ZFMK-TIS-2634118  ZFMK-TIS-2634119  ZFMK-TIS-2634120  ZFMK-TIS-2634121  ZFMK-TIS-2634123  ZFMK-TIS-2634124  ZFMK-TIS-2634125  ZFMK-TIS-2634126  ZFMK-TIS-2634128  ZFMK-TIS-2634129  ZFMK-TIS-2634130  ZFMK-TIS-2634131  ZFMK-TIS-2634137  ZFMK-TIS-2634138  ZFMK-TIS-2634139  og1  og2  og3  og4  og5 og6
                    1                 1                 1                 1                 1                 1                  1                1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1                 1    1    1    1    1   1
                    (og4,(og2,((ZFMK-TIS-2634061,og3),(((og5,og1),og6),(((((ZFMK-TIS-2633962,ZFMK-TIS-2634047),(ZFMK-TIS-2634038,(ZFMK-TIS-2634034,ZFMK-TIS-2634037))),((ZFMK-TIS-2634126,(ZFMK-TIS-2634013,ZFMK-TIS-2634128)),ZFMK-TIS-2634012)),(((((ZFMK-TIS-2634112,ZFMK-TIS-2634109),(ZFMK-TIS-2634116,(ZFMK-TIS-2634001,ZFMK-TIS-2634106))),(((ZFMK-TIS-2634011,ZFMK-TIS-2634111),ZFMK-TIS-2633977),ZFMK-TIS-2634104)),ZFMK-TIS-2634110),(((ZFMK-TIS-2633983,ZFMK-TIS-2634075),ZFMK-TIS-2634024),ZFMK-TIS-2633967))),((((ZFMK-TIS-2634119,(ZFMK-TIS-2634102,ZFMK-TIS-2634125)),(((((ZFMK-TIS-2633970,ZFMK-TIS-2634064),(ZFMK-TIS-2634042,ZFMK-TIS-2634008)),(ZFMK-TIS-2634007,ZFMK-TIS-2634046)),(ZFMK-TIS-2634045,ZFMK-TIS-2634107)),ZFMK-TIS-2634030)),(((((ZFMK-TIS-2634066,ZFMK-TIS-2633960),(ZFMK-TIS-2633999,ZFMK-TIS-2633986)),ZFMK-TIS-2633958),(ZFMK-TIS-2634035,ZFMK-TIS-2633964)),(ZFMK-TIS-2633989,ZFMK-TIS-2634065))),(((ZFMK-TIS-2634114,(((ZFMK-TIS-2633953,(((ZFMK-TIS-2633956,ZFMK-TIS-2633955),ZFMK-TIS-2634115),ZFMK-TIS-2633975)),ZFMK-TIS-2634121),(ZFMK-TIS-2634113,ZFMK-TIS-2634120))),((((((ZFMK-TIS-2634131,ZFMK-TIS-2634117),(ZFMK-TIS-2634118,ZFMK-TIS-2634108)),(ZFMK-TIS-2634138,ZFMK-TIS-2634129)),((ZFMK-TIS-2634123,ZFMK-TIS-2634130),(ZFMK-TIS-2634137,ZFMK-TIS-2634105))),ZFMK-TIS-2634100),(((ZFMK-TIS-2634103,(ZFMK-TIS-2633954,ZFMK-TIS-2633951)),ZFMK-TIS-2634101),(ZFMK-TIS-2634139,ZFMK-TIS-2634124)))),(((ZFMK-TIS-2634079,(ZFMK-TIS-2634080,(ZFMK-TIS-2634078,ZFMK-TIS-2634053))),ZFMK-TIS-2634077),((ZFMK-TIS-2634086,ZFMK-TIS-2634084),(ZFMK-TIS-2633968,(ZFMK-TIS-2634003,((ZFMK-TIS-2634088,ZFMK-TIS-2634090),(((ZFMK-TIS-2633990,ZFMK-TIS-2634022),((ZFMK-TIS-2634092,ZFMK-TIS-2634096),ZFMK-TIS-2634057)),(ZFMK-TIS-2634089,(ZFMK-TIS-2633997,ZFMK-TIS-2633993)))))))))))))));


       usedata = 1    * 0: no data (prior); 1:seq like
         nloci = 5666   * number of data sets in seqfile

     cleandata = 0      * remove sites with ambiguity data (1:yes, 0:no)?

    thetaprior = 3 0.004 e   * # invgamma(a, b) for theta
      tauprior = 3 0.036   * # invgamma(a, b) for root tau & Dirichlet(a) for other tau's

      finetune = 1: .01 .0001 .005 .0005 .01 .01 .01  # auto (0 or 1): finetune for GBtj, GBspr, theta, tau, mix, locusrate, seqerr

         print = 1 0 0 0   * MCMC samples - locusrate - heredityscalars - Genetrees
        burnin = 8000
      sampfreq = 10
       nsample = 100000
       threads = 2 1 1
