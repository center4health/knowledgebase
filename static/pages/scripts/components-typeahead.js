var ComponentsTypeahead = function () {

    var handleTwitterTypeahead = function() {

        // Example #2
        var exs = new Bloodhound({
          datumTokenizer: function(d) { return Bloodhound.tokenizers.whitespace(d.name); },
          queryTokenizer: Bloodhound.tokenizers.whitespace,
          limit: 10,
          prefetch: {
            url: '../exname.json',
            filter: function(list) {
              return $.map(list, function(country) { return { name: country }; });
            }
          }
        });
 
        exs.initialize();
         
        if (App.isRTL()) {
          $('.exa').attr("dir", "rtl");  
        } 
        $('.exa').typeahead(null, {
          name: 'exa',
          displayKey: 'name',
          hint: (App.isRTL() ? false : true),
          source: exs.ttAdapter(),
          limit: 7
        });

        var obs = new Bloodhound({
          datumTokenizer: function(d) { return Bloodhound.tokenizers.whitespace(d.name); },
          queryTokenizer: Bloodhound.tokenizers.whitespace,
          limit: 10,
          prefetch: {
            url: '../obname.json',
            filter: function(list) {
              return $.map(list, function(country) { return { name: country }; });
            }
          }
        });
 
        obs.initialize();
         
        if (App.isRTL()) {
          $('.oba').attr("dir", "rtl");  
        } 
        $('.oba').typeahead(null, {
          name: 'oba',
          displayKey: 'name',
          hint: (App.isRTL() ? false : true),
          source: obs.ttAdapter(),
          limit: 7
        });

    }

    return {
        //main function to initiate the module
        init: function () {
            handleTwitterTypeahead();
        }
    };

}();

jQuery(document).ready(function() {    
   ComponentsTypeahead.init(); 
});