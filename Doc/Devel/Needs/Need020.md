# Need 020: manage ([CRUD](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete)) [extended documents](https://github.com/MEPP-team/RICT/blob/master/Doc/Devel/Needs/Definitions.md#extended-document) 

Associated issue: [issue 35](https://github.com/MEPP-team/RICT/issues/35)


 3. realize the UDV integration of such information (using the above API): have this issue https://github.com/MEPP-team/RICT/issues/36 point to it.
 Relate this need to [need12](https://github.com/MEPP-team/RICT/blob/master/Doc/Devel/Needs/Need012.md)

WATCH OUT: there is also 
  -[this issue with need13 that is closely related (redundant ?)](https://github.com/MEPP-team/RICT/issues/4)
  - [that issue  with need 12 under the hood](https://github.com/MEPP-team/RICT/issues/36)

## Related needs
 - [Need 28](https://github.com/MEPP-team/RICT/blob/master/Doc/Devel/Needs/Need028.md): corresponding API
 - [Need 19](https://github.com/MEPP-team/RICT/blob/master/Doc/Devel/Needs/Need029.md): web based API

## User story:
As a database maintainer I want to offer a placeholder (database) for extended documents.

## Beneficiary role:
[Historians of need 004](https://github.com/MEPP-team/RICT/blob/master/Doc/Devel/Needs/Need004.md)

## Impact: major

## Maturity: immature.

## Cost evaluation: 3 weeks

## Tags or keywords
Documents, Text Files

## Data model
[Reference article](https://liris.cnrs.fr/vcity/wiki/lib/exe/fetch.php?media=papers:historicaldocuments.pdf) introducing the conceptual model e.g.
* Document details (Important information:Id, name description)
* City Object Id
* Time (period or interval)
* Tags (multivalued)

