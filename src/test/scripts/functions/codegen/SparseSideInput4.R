#-------------------------------------------------------------
#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
# 
#   http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#
#-------------------------------------------------------------

args <- commandArgs(TRUE)
options(digits=22)
library("Matrix")

X = readMM(paste(args[1], "X.mtx", sep=""))
Y = readMM(paste(args[1], "Y.mtx", sep=""))

U = matrix(1, nrow(X), 10);
V = matrix(1, ncol(X), 10);
R = as.matrix(sum((X!=0)*((U%*%t(V))/10+Y)));

writeMM(as(R,"CsparseMatrix"), paste(args[2], "R", sep=""), format="text")
