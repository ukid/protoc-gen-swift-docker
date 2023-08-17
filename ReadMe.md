镜像生成方法
====
````
docker build -t ukid/protoc-gen-swift .
````

编译方法
====
````
docker run --rm -v $(pwd)/path_to_proto:/protos -v $(pwd)/path_to_target:/out ukid/protoc-gen-swift
````