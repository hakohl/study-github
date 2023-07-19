# An example to get a branch list, using the Github GraphQL API.

import requests

headers = {"Authorization": "Bearer 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"}


def run_query(query): # A simple function to use requests.post to make the API call. Note the json= section.
    request = requests.post('https://api.github.com/graphql', json={'query': query}, headers=headers)
    if request.status_code == 200:
        return request.json()
    else:
        raise Exception("Query failed to run by returning code of {}. {}".format(request.status_code, query))

        
# The GraphQL query (with a few aditional bits included) itself defined as a multi-line string.       
query = """
{
  repository(owner:"hakohl", name:"study-github") {
    refs(first:5, refPrefix:"refs/heads/") {
      nodes {
        name
      }
    }
  }
}
"""

result = run_query(query) # Execute the query, result is a Python dictionary object

print("Branches")
print("========")

for branch in result['data']['repository']['refs']['nodes']:
   print(branch['name'])

