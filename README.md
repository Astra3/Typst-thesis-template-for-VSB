# Typst template for creating a bachelor's thesis
### What is included in this repo:
#### 📘 .typ files:
1. A **main.typ** file - the template file which already has some data written in (a "gateway" file of sorts, for demonstration purposes, the third file is listed below)
2. A **func-conf.typ** file (also referred to as funcon) - all of the needed functions that were created specifically for the template along wth the document presets for typesetting can be found here
3. A **demo.typ** file - a file which uses all of the functions that were created for this template, but without extra comments, includes image / figure and table examples and a bare bones structure of the thesis (as inspired by professor Dvorský of VSB-TUO)

#### 📄 Other files:
4. CZ and ENG visuals folder (for logos)
5. A folder for images / figures for demonstrating images in the demo file (can be repurposed for someone's thesis files)
6. A folder for the required font
7. An AI generated .bib file for demonstrating citations in the demo file (can be repurposed for someone's thesis files)

<br />
‼️ Make sure to edit the following when writing your thesis:
<br />
1. The title, author and keywords values in the **main.typ** file (at the very top of the file) <br />
2. The language setting in the **func-conf.typ** file ("cs" or "en", "sk" for Slovak is not supported!! (yet?)) <br />
3. You may delete the comment block in the **main.typ** file <br />
4. Your symbols and abbreviations in the **main.typ** file (lower in the document)

<br />

## Functions:
1. A function generating the very first page of the thesis - **generateFirstPage**
2. A function generating the pages before contents - **generateBeforeContents**
3. A function generating tables inspired by prof. Dvorský's LaTeX typesetting demo - **generateTable** **(TO BE ADDED!)**

TODO: add args and explanation of use
