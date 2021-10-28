class Services {
  static String query = """
query {
  users{
    name
    id
    profession
    age
    posts{
       id
       comment
       userId
    }
    hobbies{
      id
      title
      description
      userId
    }
  }

} 

""";
}
