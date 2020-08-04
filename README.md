# GrapQL-Github-IOS


## link docs: https://shingt.com/blog/2017-04-02-graphql-on-ios-using-apollo/

1. Trước tiên cần cài apollo-codegen ( bằng npm )



2. Download - schema of GitHub

 > apollo-codegen download-schema https://api.github.com/graphql --header "Authorization: bearer 'TokenPrivateGithub'" --output schema.json
 
3. Chạy câu lệnh này để generate ra code GraphQLQuery >>>> done. Trước khi chạy thì cần có file schema(file qui định các data có thể fetch được và mution) và .graphql(chứa các câu query)

 > apollo-codegen generate **/*.graphql --schema schema.json --output 'UserAPI'.swift
