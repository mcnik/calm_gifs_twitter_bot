import settings
import requests
import tweepy
import os
import glob
import random
import sys
reload(sys)
sys.setdefaultencoding('ISO-8859-1')

def twitter_api():
    consumer_key = settings.TWITTER_CONSUMER_KEY
    consumer_secret = settings.TWITTER_CONSUMER_SECRET
    access_token = settings.TWITTER_ACCESS_TOKEN
    access_token_secret = settings.TWITTER_ACCESS_SECRET

    auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
    auth.set_access_token(access_token, access_token_secret)
    api = tweepy.API(auth)
    return api

path = r"C:/iolab/twitter-bots/calmgifs/makegif"
random_filename = random.choice([
    x for x in os.listdir(path)
    if os.path.isfile(os.path.join(path, x)) and x.endswith(".gif")
])

api = twitter_api()
print os.path.join(path, random_filename)
api.update_with_media(os.path.join(path, random_filename))