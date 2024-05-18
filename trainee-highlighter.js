document.addEventListener('DOMContentLoaded', (event) => {
    var wordsToHighlightTrainee = [
      'Vickruck', 
      'Robinson', 
      'Kwafo',
      'Neame',
      'Cohen',
      'Innes',
      'Clake',
      'Nguyen',
      'Ladle',
      'Rout',
      'Purvis',
      'Edwards',
      'Best',
      'Johnson',
      'Gavin',
      'Chang',
      'Retzlaff',
      'Doctolero',
      'Chubaty',
      `Kersteins`
      ]; 
      
    var wordsToHighlightPI = [
      'Galpern',
      'Summers'
      ];
      
    var listItems = document.querySelectorAll('li');
    listItems.forEach(function(li) {
        var html = li.innerHTML;

        // Apply trainee highlighting
        wordsToHighlightTrainee.forEach(function(word) {
            var regex = new RegExp('\\b' + word + '\\b', 'g');
            html = html.replace(regex, '<span class="trainee-highlight">' + word + '</span>');
        });

        // Apply PI highlighting
        wordsToHighlightPI.forEach(function(word) {
            var regex = new RegExp('\\b' + word + '\\b', 'g');
            html = html.replace(regex, '<span class="pi-highlight">' + word + '</span>');
        });

        li.innerHTML = html;
    });
});