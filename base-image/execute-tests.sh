#!/bin/bash -e
# Copyright 2021 WSO2 Inc. (http://wso2.org)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# ----------------------------------------------------------------------------
# Running the Load Test
# ----------------------------------------------------------------------------
set -e
cd /base-image/netty-service/
./netty-start.sh -m 1g -- --ssl --key-store-file /base-image/h1_h1_passthrough/security/ballerinaKeystore.p12 --key-store-password ballerina
sleep 60s
sudo chmod -R 777 /base-image/h1_h1_passthrough
cd /base-image/h1_h1_passthrough
nohup nohup bal run
