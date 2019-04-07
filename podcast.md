---
layout: minpage
title: Agile Dojo Talks
subtitle: Podcast about Development Productivity
bigimg: /assets/agile_dojo_talks_banner.png
---
  <div class="row">
      <div class="col-lg-11">
        <div class="jumbotron">
          <div class="media">
            <div class="media-left">  
              <a href="#">
                <img class="media-object" src="/assets/podcast/agile_dojo_talks_small.png"
                alt="Agile Dojo Talks">
              </a>
            </div>

            <div class="media-body">
              <h2 class="media-heading">Über die Kunst, die nicht getane Arbeit zu maximieren</h2>
              <p>
                Für mich ist die Softwarentwicklung eine der kreativsten Tätigkeiten, die ich mir vorstellen kann. Es bereitet mir viel Vergnügen, neue Produkte zu entwickeln und das ganze am liebsten ohne lästigen Overhead. Doch welche Methoden, Praktiken und Werkzeuge sind dafür am besten geeignet? Diese Frage möchte ich in dieser Podcastreihe zusammen mit Experten näher beleuchten.
              </p>
              <button type="button" class="btn btn-default btn-lg">
                <a href="/podcast.rss"><span class="glyphicon glyphicon-headphones" aria-hidden="true"></span> Podcastfeed abonnieren</a>
              </button>
            </div>
          </div>
        </div>
      </div>
  </div>

  {% assign episodes = site.podcast | sort: 'date' | reverse %}
  {% for episode in episodes %}


  <div class="row  post-preview">
    <div class="col-lg-4">
      <div class="plyr__video-embed">
          <iframe
              src="https://www.youtube.com/embed/{{episode.youtube_id}}?showinfo=0&modestbranding=1&playsinline=0&origin=http://agiledojo.de&enablejsapi=1"
              allowfullscreen></iframe>
      </div>
    </div>
    <div class="col-lg-7">
          <h3>{{episode.title}}</h3>
          <h4>{{episode.subtitle}}</h4>
          <p>{{episode.content}}</p>
          <audio id="player" controls>
              <source src="{{episode.file}}" type="audio/mp3" />
          </audio>

    </div>
  </div>

		{% endfor %}
