const getProductQuery = '''
query Product() {
       ships {
          id
          model 
          name
          image
          status
          roles
          year_built
          type
    }}
''';