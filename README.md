### Manual setup steps 

For manual setup steps, please look at following repo.  (Word doc and encoding jar) 

https://github.com/una-tapa/WebSphere-Classic-Custom-encoding-sample

### How to build docer image 
```
docker build -t myencryptsample .
```

### Execution (to be updated) 
```
docker run -it -p 9080:9080 -p 9443:9443 myencryptsample
```

### Test (to be updated) 

To be updated. 

First confirm server starts up with {xor} password
Trigger the encryption
Confirm custom encoding took place. 

