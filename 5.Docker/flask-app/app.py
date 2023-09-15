from flask import Flask, render_template
import random
app = Flask(__name__)

# list of meme gifs
images = [
    "https://24.media.tumblr.com/d8a3a689658dd4d032a65bd77c34be93/tumblr_mj29fhaCLH1r40mo0o1_400.gif",
    "https://66.media.tumblr.com/fde64bab9db033beb92772be02c2c50c/tumblr_pjzpke2kKc1x9u51to1_400.gif",
    "https://33.media.tumblr.com/0e2d624b93a90724744733a01515e01b/tumblr_nwhx0sUjJr1ujab14o1_250.gif",
    "https://37.media.tumblr.com/0d4728ac34d26821014c4726567ecdf3/tumblr_n4fapuMWG11rwgdwdo1_400.gif",
    "https://68.media.tumblr.com/ab2be217c8d385d4529f2d18561a5424/tumblr_opbgvp2pqr1wovts0o1_500.gif",
    "https://25.media.tumblr.com/3dc7a77eefc9baca434492620b75be0e/tumblr_mhtofd5GAL1r40mo0o1_400.gif",
    "https://78.media.tumblr.com/2a2700b560679f28f7b27bdcb7858e1e/tumblr_pb5m8zTGy91s3hx8ko1_400.gif",
    "https://68.media.tumblr.com/c16e643f6bd9b03b54e84d244609c1af/tumblr_opce6gzarb1wovts0o1_400.gif",
    "https://24.media.tumblr.com/2c9f30145210dac6ec706d2f707da6b5/tumblr_mgdb5okZSD1rrgipto1_400.gif",
    "https://media.tenor.com/rtKFHEGpoPwAAAAM/meme-lang.gif",
    "https://38.media.tumblr.com/dbe8cfd0e47f05fd2c70db21c862c4b1/tumblr_nked29sKb31rs4x5ro1_500.gif"
]
@app.route('/')
def index():
    url = random.choice(images)
    return render_template('index.html', url=url)

if __name__ == "__main__":
    app.run(host="0.0.0.0")