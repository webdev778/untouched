import ReactOnRails from 'react-on-rails';

import CompositeImageUploader from '../components/CompositeImageUploader';
import CompositeImageUploaderItem from '../components/CompositeImageUploaderItem';
import CompositeVideoUploader from '../components/CompositeVideoUploader';
import CompositeVideoUploaderItem from '../components/CompositeVideoUploaderItem';
import DevelopmentTableEditor from '../components/DevelopmentTableEditor';
import DevelopmentTableEditorFooter from '../components/DevelopmentTableEditorFooter';


ReactOnRails.setOptions({
  traceTurbolinks: TRACE_TURBOLINKS, // eslint-disable-line no-undef
});

ReactOnRails.register({
  CompositeImageUploader,
  CompositeImageUploaderItem,  
  CompositeVideoUploader,
  CompositeVideoUploaderItem,
  DevelopmentTableEditor,
  DevelopmentTableEditorFooter
});
