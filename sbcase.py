"""
Spongebob-case for MacOS.
 
For more fun, add to your bash_profile with:
function sbcase() {
    python3 "~/sbcase.py" "$1"
}
export sbcase
 
Usage: sbcase "gonna make a meme"
"""
 
import sys, random, subprocess
if len(sys.argv) != 2:
    print('USAGE: sbcase <phrase in double quotes>')
 
phrase = sys.argv[1]
result = list()
 
for char in phrase:
    should_change = bool(random.getrandbits(1)) and char.isalpha()
 
    if should_change:
        if char.islower():
            char = char.upper()
        elif char.isupper():
            char = char.lower()
 
    result.append(char)
 
output = ''.join(result)
print('Copied to clipboard: ' + output)
 
# Add to clipboard so its ready to go
process = subprocess.Popen(
        'pbcopy', env={'LANG': 'en_US.UTF-8'}, stdin=subprocess.PIPE)
process.communicate(output.encode('utf-8'))
