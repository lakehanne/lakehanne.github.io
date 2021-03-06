---
layout: post
permalink: pubs
---

<!-- > Intent upon giving as much as I have gotten, here are my contributions, given freely and cheerfully. -->



© {{ "now" | date: "%Y" }} IEEE.  Personal use of the IEEE materials here is permitted.  Permission from IEEE must be obtained for all other uses, in any current or future media, including reprinting/republishing any of these materials for advertising or promotional purposes, creating new collective works, for resale or redistribution to servers or lists, or reuse of any copyrighted component of these works in other works.<br><br>


<table class="table table-hover" >

	<hr>


<center>
<a href="#unpubs"><font size="4">Evolving Drafts / </font></a>
<a href="#revs"><font size="4">Submitted / </font></a>
<a href="#pubs"><font size="4">Published / </font></a>
<a href="#reps"><font size="4">Technical Reports.</font></a>
</center>

<a name="unpubs"></a>
<table  class="table table-hover" >
  	<center><h3><b><a href="https://en.wikipedia.org/wiki/Working_paper">Evolving Drafts</a></b></h3></center>
{% for item in site.data.papers.publications %}
  	{% for paper in item.paperitems %}
	          	{% if paper.paper_status contains "Manuscript" %}
		        	<tr>
		          		<td width="95%" align="left"><a href="{{ paper.location }}" 	target="blank">{{  paper.title  }}.</a><br>
		          			{% for author in paper.authors %}
		          				{{ author  }}
		          			{% endfor %}
			      		</td>
		      		</tr>
		      	{% endif %}
	    	{% endfor %}
	  	{% endfor %}
</table>

<a name="revs"></a>
<table  class="table table-hover" >
<center><h3><b>Submitted Works</b></h3></center>
		{% for item in site.data.papers.publications %}
	    	{% for paper in item.paperitems %}
          	{% if paper.paper_status contains "Submitted" %}
		        	<tr>
		          		<td width="95%" align="left"><a href="{{ paper.location }}" 	target="blank">{{  paper.title  }}.</a><br>
		          			{% for author in paper.authors %}
		          				{{ author  }}
		          			{% endfor %}<br>
		      				<a href="{{ paper.venue_web }}" target="blank"><i>Submitted to {{ paper.venue }}</i>.  </a> {{ paper.year }}.<br>
			      		</td>
		      		</tr>
	      	{% endif %}
    	{% endfor %}
  	{% endfor %}
</table>


<a name="pubs"></a>
<table  class="table table-hover" >
<center><h3><b>Published Works</b></h3></center>


Premier Robotics and Automation Society, Algorithmic Foundations of Robotics, ASME, and Medical Physics publications (WAFR, IROS, JMR, NIPS, PhysMed, and ICRA) are highly selective venues for archival papers, similar to selective IEEE journals in visibility and strong scientific/engineering communications.


		{% for item in site.data.papers.publications %}
	    	{% for paper in item.paperitems %}
	          	{% if paper.paper_status contains "Accepted" %}
		        	<tr>
		          		<td width="95%" align="left"><a href="{{ paper.location }}" 	target="blank">{{  paper.title  }}.</a><br>
		          			{% for author in paper.authors %}
		          				{{ author  }}
		          			{% endfor %}<br>
		      				<a href="{{ paper.venue_web }}" target="blank"><i>{{ paper.venue }}</i>.  </a> {{ paper.year }}.<br>
			      		</td>
		      		</tr>
		      	{% endif %}
	    	{% endfor %}
	  	{% endfor %} 	
</table>

<a name="reps"></a>
<table  class="table table-hover" >
  	<center><h3><b>Technical Reports</b></h3></center>
		{% for item in site.data.papers.publications %}
	    	{% for paper in item.paperitems %}
	          	{% if paper.paper_status contains "Technical" %}
		        	<tr>
		          		<td width="95%" align="left"><a href="{{ paper.location }}" 	target="blank">{{  paper.title  }}.</a><br>
		          			{% for author in paper.authors %}
		          				{{ author  }}
		          			{% endfor %}
		      				<a href="{{ paper.venue_web }}" target="blank"><i>{{ paper.venue }}</i>.  </a> {{ paper.year }}.
			      		</td>
		      		</tr>
		      	{% endif %}
	    	{% endfor %}
	  	{% endfor %}
</table>
