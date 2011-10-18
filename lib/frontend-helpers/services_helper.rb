module FrontendHelpers
  module ServicesHelper

    def webservice(options = [])
      options.each do |s|
        send(s.to_s)
      end
    end

    def google
      if !service(:google, :account_id).blank? && !service(:google, :site_name).blank?
        haml_tag :script do
          haml_concat "var _gaq = _gaq || []; _gaq.push(['_setAccount', '#{service(:google, :account_id)}']); _gaq.push(['_setDomainName', '.#{service(:google, :site_name)}']); _gaq.push(['_trackPageview']);(function() { var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true; ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js'; var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);})();"
        end
      end
    end

    def chartbeat
      if !service(:chartbeat, :uid).blank? && !service(:chartbeat, :domain).blank?
        haml_tag :script do
          haml_concat "var _sf_async_config={uid:#{service(:chartbeat, :uid)},domain:'#{service(:chartbeat, :domain)}'}; (function(){function loadChartbeat() {window._sf_endpt=(new Date()).getTime();var e = document.createElement('script');e.setAttribute('language', 'javascript');e.setAttribute('type', 'text/javascript');e.setAttribute('src',(('https:' == document.location.protocol) ? 'https://a248.e.akamai.net/chartbeat.download.akamai.com/102508/' : 'http://static.chartbeat.com/') +'js/chartbeat.js');document.body.appendChild(e);} var oldonload = window.onload; window.onload = (typeof window.onload != 'function') ? loadChartbeat : function() { oldonload(); loadChartbeat(); }; })();"
        end
      end
    end

    def inspectlet
      if service(:inspectlet, :setup) != false
        haml_tag :script, {:id => "inspectletjs"} do
          haml_concat "var __insp = __insp || []; var __inspHost = (('https:' == document.location.protocol) ? 'https://www.inspectlet.com' : 'http://www.inspectlet.com'); document.write(unescape('%3Cscript id='inspsync' src='' + __inspHost + '/inspect_nojquery/3664049264.js' type='text/javascript'%3E%3C/script%3E'));"
        end
      end
    end

    def mixpanel
      if !service(:mixpanel, :init).blank?
        haml_tag :script do
          haml_concat "var mpq=[]; mpq.push(['init','#{service(:mixpanel, :init)}']); (function(){ var a=document.createElement('script'); a.type='text/javascript'; a.async=true; a.src=(document.location.protocol==='https:'?'https:':'http:')+'//api.mixpanel.com/site_media/js/api/mixpanel.js'; var b=document.getElementsByTagName('script')[0]; b.parentNode.insertBefore(a,b) })();"
        end
      end
    end

    def woopra
      if !service(:woopra, :domain).blank?
        haml_tag :script do
          haml_concat "var woo_settings = {idle_timeout:'300000', domain:'#{service(:woopra, :domain)}'}; var woo_actions = [{type:'pageview',url:window.location.pathname+window.location.search,title:document.title}]; (function(){ var wsc = document.createElement('script'); wsc.src = document.location.protocol+'//static.woopra.com/js/woopra.js'; wsc.type = 'text/javascript'; wsc.async = true; var ssc = document.getElementsByTagName('script')[0]; ssc.parentNode.insertBefore(wsc, ssc); })();"
        end
      end
    end

    def kissmetrics
      if !service(:kissmetrics, :setup).blank?
        haml_tag :script do
          haml_concat "var _kmq = _kmq || []; function _kms(u){ setTimeout(function(){ var s = document.createElement('script'); var f = document.getElementsByTagName('script')[0]; s.type = 'text/javascript'; s.async = true; s.src = u; f.parentNode.insertBefore(s, f); }, 1); }_kms('//i.kissmetrics.com/i.js');_kms('//doug1izaerwt3.cloudfront.net/a87ca4a272c627eb3f0e7c3a23c88f624db1eff1.1.js');"
        end
      end
    end

    def quantcast
      if !service(:quantcast, :qacct).blank?
        haml_tag :script do
          haml_concat "var _qevents = _qevents || []; (function() { var elem = document.createElement('script'); elem.src = (document.location.protocol == 'https:' ? 'https://secure' : 'http://edge') + '.quantserve.com/quant.js'; elem.async = true; elem.type = 'text/javascript'; var scpt = document.getElementsByTagName('script')[0]; scpt.parentNode.insertBefore(elem, scpt); })(); _qevents.push({ qacct:'#{service(:quantcast, :qacct)}' });"
        end
        haml_tag :noscript do
          haml_concat "<div style='display:none;'> <img src='//pixel.quantserve.com/pixel/#{service(:quantcast, :qacct)}.gif' border='0' height='1' width='1' alt='Quantcast'/></div>"
        end
      end
    end

    def olark
      if !service(:olark, :identify).blank?
        haml_tag :script do
          haml_concat "window.olark||(function(i){var e=window,h=document,a=e.location.protocol=='https:'?'https:':'http:',g=i.name,b='load';(function(){e[g]=function(){(c.s=c.s||[]).push(arguments)};var c=e[g]._={},f=i.methods.length; while(f--){(function(j){e[g][j]=function(){e[g]('call',j,arguments)}})(i.methods[f])} c.l=i.loader;c.i=arguments.callee;c.f=setTimeout(function(){if(c.f){(new Image).src=a+'//'+c.l.replace('.js','.png')+'&'+escape(e.location.href)}c.f=null},20000);c.p={0:+new Date};c.P=function(j){c.p[j]=new Date-c.p[0]};function d(){c.P(b);e[g](b)}e.addEventListener?e.addEventListener(b,d,false):e.attachEvent('on'+b,d); (function(){function l(j){j='head';return['<',j,'></',j,'><',z,' onload='var d=',B,';d.getElementsByTagName('head')[0].',y,'(d.',A,'('script')).',u,'='',a,'//',c.l,''',''','></',z,'>'].join('')}var z='body',s=h[z];if(!s){return setTimeout(arguments.callee,100)}c.P(1);var y='appendChild',A='createElement',u='src',r=h[A]('div'),G=r[y](h[A](g)),D=h[A]('iframe'),B='document',C='domain',q;r.style.display='none';s.insertBefore(r,s.firstChild).id=g;D.frameBorder='0';D.id=g+'-loader';if(/MSIE[ ]+6/.test(navigator.userAgent)){D.src='javascript:false'} D.allowTransparency='true';G[y](D);try{D.contentWindow[B].open()}catch(F){i[C]=h[C];q='javascript:var d='+B+'.open();d.domain=''+h.domain+'';';D[u]=q+'void(0);'}try{var H=D.contentWindow[B];H.write(l());H.close()}catch(E){D[u]=q+'d.write(''+l().replace(/'/g,String.fromCharCode(92)+''')+'');d.close();'}c.P(2)})()})()})({loader:(function(a){return 'static.olark.com/jsclient/loader0.js?ts='+(a?a[1]:(+new Date))})(document.cookie.match(/olarkld=([0-9]+)/)),name:'olark',methods:['configure','extend','declare','identify']}); olark.identify('#{service(:olark, :identify)}');"
        end
      end
    end

  private #############

    def services
      YAML.load_file(File.join(Rails.root, 'config', 'services.yml')) rescue {}
    end

    def service(service, key)
      ENV["#{service.to_s.upcase}_#{key.to_s.upcase}"] || services[service][Rails.env.to_sym][key]
    end
  end
end

ActionView::Base.send :include, FrontendHelpers::ServicesHelper