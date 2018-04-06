#! /bin/sh

root_path=$(pwd)
bedrock_js_path="${root_path}/assets/bedrock/js/"
bedrock_scss_path="${root_path}/assets/bedrock/scss/"
yoast_css_path="${root_path}/assets/_vendor/yoastseo/css/"
ace_editor_path="${root_path}/assets/_vendor/ace/"
tinymce_editor_path="${root_path}/assets/_vendor/tinymce/"

cd "../../Node/bedrock/"
foundation build

rm -r "$bedrock_js_path"
cp -a "dist/assets/js/." "$bedrock_js_path"

rm -r "$bedrock_scss_path"
cp -a "src/assets/scss/." "$bedrock_scss_path"

rm -r "$yoast_css_path"
cp -a "dist/assets/yoastseo/css/." "$yoast_css_path"

rm -r "$ace_editor_path"
cp -a "dist/assets/ace-builds/src/." "$ace_editor_path"

rm -r "$tinymce_editor_path"
cp -a "dist/assets/tinymce/." "$tinymce_editor_path"
