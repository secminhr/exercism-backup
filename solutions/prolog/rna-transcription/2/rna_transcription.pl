rna_transcription_('G', 'C').
rna_transcription_('C', 'G').
rna_transcription_('T', 'A').
rna_transcription_('A', 'U').

rna_transcription(DStr, RStr) :-
    string_chars(DStr, DList),
    maplist(rna_transcription_, DList, RList),
    string_chars(RStr, RList).