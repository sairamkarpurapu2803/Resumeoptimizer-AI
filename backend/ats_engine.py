
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity

def ats_score(resume,job):
    v=TfidfVectorizer(stop_words="english")
    data=v.fit_transform([resume,job])
    score=cosine_similarity(data[0],data[1])[0][0]
    return {"ats_score":round(score*100,2)}
