from llama_cpp import Llama
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('--model', type=str ,required=True)
parser.add_argument('--max_tokens', type=int, default=128)
parser.add_argument('--temperature', type=float, default=0.5)
parser.add_argument('--top_p', type=float, default=0.5)
parser.add_argument('--top_k', type=int, default=40)
parser.add_argument('--repeat_penalty', type=float, default=1.5)
args = parser.parse_args()

llm = Llama(args.model,verbose=False)
question = input("Please enter your question: ")

print(f"Question: {question}")

output = output = llm(f"Q: {question}? A: ",
                      max_tokens=args.max_tokens,
                      temperature = args.temperature,
                      top_p = args.top_p,
                      top_k=args.top_k,
                      repeat_penalty=args.repeat_penalty,
                      stop=["Q:", "\n"],
                      echo=False)
print(f"Response: {output['choices'][0]['text']}")