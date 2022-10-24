Language = {}

Language.Country = {
     -- Template
     [''] = { -- Country
          ['Status'] = '',
          ['Verif'] = '',
          ['BypassOn'] = '',
          ['BypassOff'] = '',
     }, 

     ['en'] = { -- English 🇬🇧
          ['Status'] = 'Active Maintenance',
          ['Verif'] = 'Permission Pass..',
          ['BypassOn'] = 'Approved Login',
          ['BypassOff'] = 'Connection is not approved ! \n\n The server is under maintenance, an announcement will be made when it is completed',
     },

     ['fr'] = { -- French 🇫🇷
          ['Status'] = 'Maintenance active',
          ['Verif'] = 'Vérification des autorisations..',
          ['BypassOn'] = 'Connexion approuvé',
          ['BypassOff'] = 'Connexion n\'est pas approuvé ! \n\n Le serveur est en maintenance, une annonce sera faite quand celle-ci sera terminée',
     }, 
} 