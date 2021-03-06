package codecanaan

class GoogleTagLib {
    static namespace = "google"
    
    def analytics = { attr, body ->
        out << render(template: '/taglib/google/analytics')
    }
    
    /**
     * Google AdSense
     * https://support.google.com/adsense/answer/185665?hl=en
     */
    def adsense = { attr, body ->
        out << render(template: '/taglib/google/adsense', model: [
            adClient: grailsApplication.config.google.adsense.adClient,
            width: attr.width?:125,
            height: attr.height?:125
        ])
    }
}
