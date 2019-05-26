---
layout: minpage
title: Training
subtitle: Making great Teams excellent
bigimg: /assets/training.png
---
  <div class="row">
      <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
      <h1>No Train No Gain</h1>
      <p class="lead">Gemeinsames, kontinuierliches Trainieren ist für alle Produktentwicklungsteams der Schlüssel zu Erfolg. Schließlich feuern die Bayern ja auch nicht Ihren Trainer, wenn sie mal wieder das Triple gewonnen haben, weil sie ja jetzt wissen, wie man erfolgreich Fußball spielt, auch wenn ich mich als Schalker sehr darüber freuen würde :-).
      </p>

      <p>Die meisten Angebote rund um die agile Produktentwicklung beschränken sich bedauerlicherweise auf die Rollen des Product Owners und Scrum Masters. Für das Umsetzungsteam sind die Anforderungen, die die neue, agilen Arbeitswelt mitbringt, jedoch nicht minder herausfordernd. Wie sieht die Selbstorganisation in einem interdisziplinären Team in der Praxis aus und welche neuen handwerklichen Fertigkeiten in Betrieb, Programmierung, Architektur, Qualitätssicherung und Anforderungsmanagement müssen gelernt werden?
      </p>

            <blockquote>
            <p>Christian is one of the most knowledgeable people I know when it comes to agile methodology. He's empathic, patient, laid back and very thorough. Cannot recommend him enough.</p>
            <b>-- Martin Menschner, CTO & Founder at Rhebo</b>
            </blockquote>

      <p>
      Basierend auf meinen Beobachtungen, die ich in den vergangenen Jahren durch die Arbeit mit Teams in Start Ups, Mittelständlern und Großkonzernen machen konnte, habe ich Workshops erarbeitet, die das Wissen über Schlüsselpraktiken agiler Softwareentwicklung in Hands-On-Übungen vermitteln. Nach und nach werde ich diese hier vorstellen. Wer sich über neue Angebote informieren möchte, sollte mir daher über Twitter folgen oder sich per Mail an mich wenden.
      </p>


      </div>
  </div>

  {% for training in site.trainings %}

  {% endfor %}

  {% include thumbnail_grid.html collection=site.training more_text="Mehr erfahren" %}
