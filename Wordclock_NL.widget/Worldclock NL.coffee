#
# Word Clock widget for Übersicht
#

style: """
  bottom:5%
  left: 81%
  width: 45%
  font-family: 'Isonorm3098'
  color: rgba(128,128,128,.25)
  font-size: 1.50vw
  letter-spacing: 0.5em
  font-smoothing: antialiased
  line-height: 1.11

  .active
    color: rgba(256, 256, 256, .95)
    text-shadow: 2px 2px 0px rgba(0,0,0,.15)

"""

# Get the current hour as word.
command: ""

# Lower the frequency for more accuracy.
refreshFrequency: (500 * 10) # (500 * n) seconds


render: (o) -> """
  <div id="content">
    <span id="het">HET</span>K<span id="is">IS</span>A<span id="vijf">VIJF</span><br>
    <span id="tien">TIEN</span>ATZ<span id="voor1">VOOR</span><br>
    <span id="over1">OVER</span>ME<span id="kwart">KWART</span><br>
    <span id="half">HALF</span>SPM<span id="over2">OVER</span><br>
    <span id="voor2">VOOR</span>THG<span id="h_een">ÉÉN</span>S</span><br>
    <span id="h_twee">TWEE</span>AMC<span id="h_drie">DRIE</span><br>
    <span id="h_vier">VIER</span><span id="h_vijf">VIJF</span><span id="h_zes">ZES</span><br>
    <span id="h_zeven">ZEVEN</span>O<span id="h_negen">NEGEN</span><br>
    <span id="h_acht">ACHT</span><span id="h_tien">TIEN</span><span id="h_elf">ELF</span><br>
    <span id="h_twaalf">TWAALF</span>PM<span id="uur">UUR</span><br>
  </div>
"""


update: (output, dom) ->
  hours = [null,"een","twee","drie","vier","vijf","zes","zeven","acht","negen","tien","elf","twaalf"]

  date   = new Date()
  minute = date.getMinutes()
  hour   = date.getHours()

  $(dom).find(".active").removeClass("active")

  $(dom).find("#het").addClass("active")
  $(dom).find("#is").addClass("active")

  if minute <= 2 || minute >= 58
    $(dom).find("#uur").addClass("active")
  else if minute >= 3 && minute <= 7
    $(dom).find("#vijf").addClass("active")
    $(dom).find("#over2").addClass("active")
  else if minute >= 53 && minute <= 57
    $(dom).find("#vijf").addClass("active")
    $(dom).find("#voor2").addClass("active")
  else if minute >= 8 && minute <= 12
    $(dom).find("#tien").addClass("active")
    $(dom).find("#over2").addClass("active")
  else if minute >= 48 && minute <= 52
    $(dom).find("#tien").addClass("active")
    $(dom).find("#voor2").addClass("active")
  else if minute >= 13 && minute <= 17
    $(dom).find("#kwart").addClass("active")
    $(dom).find("#over2").addClass("active")
  else if minute >= 43 && minute <= 47
    $(dom).find("#kwart").addClass("active")
    $(dom).find("#voor2").addClass("active")
  else if minute >= 18 && minute <= 22
    $(dom).find("#tien").addClass("active")
    $(dom).find("#voor1").addClass("active")
    $(dom).find("#half").addClass("active")
  else if minute >= 38 && minute <= 42
    $(dom).find("#tien").addClass("active")
    $(dom).find("#over1").addClass("active")
    $(dom).find("#half").addClass("active")
  else if minute >= 23 && minute <= 27
    $(dom).find("#vijf").addClass("active")
    $(dom).find("#voor1").addClass("active")
    $(dom).find("#half").addClass("active")
  else if minute >= 33 && minute <= 37
    $(dom).find("#vijf").addClass("active")
    $(dom).find("#over1").addClass("active")
    $(dom).find("#half").addClass("active")
  else if minute >= 28 && minute <= 32
    $(dom).find("#half").addClass("active")

  if minute >= 18
    hour++

  hour = hour % 12
  hour = 12 if hour == 0
  hour_str = hours[hour]
  $(dom).find("#h_#{hour_str}").addClass("active")
