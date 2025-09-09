rna_transcription_('G', 'C').
rna_transcription_('C', 'G').
rna_transcription_('T', 'A').
rna_transcription_('A', 'U').

rna_transcription_([], []).
rna_transcription_([DH|DT], [RH|RT]) :- rna_transcription_(DH, RH), rna_transcription_(DT, RT).

rna_transcription(DStr, RStr) :-
    string_chars(DStr, DList),
    rna_transcription_(DList, RList),
    string_chars(RStr, RList).