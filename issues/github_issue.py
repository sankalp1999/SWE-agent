import sys
from litellm import completion
import os
from dotenv import load_dotenv


load_dotenv()

def main():
    # Check if the user has provided the input filename
    if len(sys.argv) < 2:
        print("Usage: python script.py <test_output_file>")
        sys.exit(1)
    
    test_output_file = sys.argv[1]
     
    file_name_without_extension = os.path.splitext(os.path.basename(test_output_file))[0]
    project_name = file_name_without_extension  
    
    
    # Read the test output from the input file
    try:
        with open(test_output_file, 'r') as f:
            test_output = f.read()
    except FileNotFoundError:
        print(f"Error: The file '{test_output_file}' does not exist.")
        sys.exit(1)

    prompt_text = f"""Given the test output below, summarize the most important and only one test failure in the format of a GitHub issue. Include:
Test file name: {test_output_file}
The total number of tests collected, passed, and failed.
A list of passed tests.
For each failed test:
The error message, including relevant stack trace snippets.
The filename and line number where the error originated.
An explanation of the error.
Additional details or patterns observed in the failures.
Possible causes and solutions for the failures.


Provide just the content of the issue.md file and no other explanation.
Test Output:
{test_output}"""

    # Use f-string to inject test_output into the message content
    response = completion(
        model="claude-3-5-sonnet-20241022",
        max_tokens=8192,
        temperature=0,
        messages=[
            {
                "role": "user",
                "content": [
                    {
                        "type": "text",
                        "text": prompt_text
                    }
                ]
            }
        ]
    )

    # Retrieve the assistant's response content
    response_content = response.choices[0].message.content
    
    # Write the content to issue.md in the same directory
    try:
        with open("issue.md", "w", encoding="utf-8") as issue_file:
            issue_file.write(response_content)
        print("issue.md has been created successfully.")
    except IOError as e:
        print(f"Error writing to issue.md: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()

# python issues/github_issue.py issues/test_output.txt
