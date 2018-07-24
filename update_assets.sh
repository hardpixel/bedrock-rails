#! /bin/sh

root_path=$(pwd)
bedrock_js_path="${root_path}/assets/bedrock/js"
bedrock_scss_path="${root_path}/assets/bedrock/scss"
yoast_css_path="${root_path}/assets/_vendor/yoastseo/css"
ace_editor_path="${root_path}/assets/_vendor/ace"
tinymce_editor_path="${root_path}/assets/_vendor/tinymce"
foundation_scss_path="${root_path}/assets/_vendor/foundation/scss"
foundation_vendor_path="${root_path}/assets/_vendor/foundation/_vendor"
motion_ui_path="${root_path}/assets/_vendor/motion-ui"

cd "../../Node/bedrock/"

if [[ $1 == 'build' ]]; then
  foundation build
fi

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

rm -r "$foundation_scss_path"
cp -a "node_modules/foundation-sites/scss/." "$foundation_scss_path"

rm -r "$foundation_vendor_path"
cp -a "node_modules/foundation-sites/_vendor/." "$foundation_vendor_path"

rm -r "$motion_ui_path"
cp -a "node_modules/motion-ui/src/." "$motion_ui_path"
