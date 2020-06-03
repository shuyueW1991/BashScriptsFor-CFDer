#!/bin/bash

fluent -cnf=mffoil03 -i prep_1proc.jou -t1 2ddp
fluent -cnf=mffoil03 -i cal_anyproc_sample.jou -t10 2ddp

