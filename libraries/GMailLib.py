from imap_tools import MailBox
from imap_tools import AND
from bs4 import BeautifulSoup
from robot.libraries.BuiltIn import BuiltIn
from robot.api import logger
import re

#Python function for if the respone will gome back as html format
def get_email_links_html(email, pwd, subject, inbody, folder='INBOX'):
    with MailBox(host='imap.gmail.com', port=993).login(email, pwd, folder) as mailbox:
        bodies = [msg.html for msg in mailbox.fetch(AND(subject=subject, text=inbody, seen=False), reverse = True)]
    if len(bodies) == 0:
        BuiltIn().fail(f"No unread email with specified criteria was found subject: {subject}, inbody: {inbody}")
    
    soup = BeautifulSoup(str(bodies))
    links = []
    
    for link in soup.findAll('a', attrs={'href': re.compile("^https://")}):
        links.append(link.get('href'))
    if len(links) == 0:
        BuiltIn().fail(f"No urls found in email with specified criteria was found subject: {subject}, inbody: {inbody}")
    
    return links

def get_email_links(email, pwd, subject, folder='INBOX'):
    # get list of email bodies from INBOX folder
    with MailBox(host='imap.gmail.com', port=993).login(email, pwd, folder) as mailbox:
        bodies = [msg.html for msg in mailbox.fetch(AND(subject=subject), reverse = True)]

    soup = BeautifulSoup(str(bodies))
    links = []
    for link in soup.findAll('a', attrs={'href': re.compile("^https://")}):
        links.append(link.get('href'))

    return links

def get_email_soup(email, pwd, subject, folder='INBOX'):
    # get list of email bodies from INBOX folder
    with MailBox(host='imap.gmail.com', port=993).login(email, pwd, folder) as mailbox:
        bodies = [msg.html for msg in mailbox.fetch(AND(subject=subject), reverse = True)]

    soup = BeautifulSoup(str(bodies))

    return soup

def get_email_bodies(email, pwd, subject, folder='INBOX'):
    # get list of email bodies from INBOX folder
    with MailBox(host='imap.gmail.com', port=993).login(email, pwd, folder) as mailbox:
        bodies = [msg.html for msg in mailbox.fetch(AND(subject=subject), reverse = True)]

    return bodies