"""Quickly make a decision
Syntax: .decide"""
import requests

from pearl.utils import pearl_on_cmd
from pearl import CMD_HELP


@pearl.on(pearl_on_cmd("decide"))
async def _(event):
    if event.fwd_from:
        return
    message_id = event.message.id
    if event.reply_to_msg_id:
        message_id = event.reply_to_msg_id
    r = requests.get("https://yesno.wtf/api").json()
    await borg.send_message(
        event.chat_id, r["answer"], reply_to=message_id, file=r["image"]
    )
    await event.delete()
    
CMD_HELP.update(
    {
        "decide": ".decide\nUsage : Use this plugin to quickly make a decision."
    }
)
