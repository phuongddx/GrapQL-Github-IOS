# GrapQL-Github-IOS


link docs: https://shingt.com/blog/2017-04-02-graphql-on-ios-using-apollo/

Trước tiên cần cài apollo-codegen ( bằng npm )



=>> Download - schema of GitHub
apollo-codegen download-schema https://api.github.com/graphql --header "Authorization: bearer <Token github.com/>" --output schema.json

=>> Chạy câu lệnh này để generate ra code GraphQLQuery >>>> done. Trước khi chạy thì cần có file schema và .graphql ( chứa các câu query)
apollo-codegen generate **/*.graphql --schema schema.json --output <Tên của file code được generate ra>.swift
