import { CloudUpload } from '@mui/icons-material';
import { Button, styled } from '@mui/material';
import { fileAPI } from './redux/api';
import { useEffect } from 'react';

const VisuallyHiddenInput = styled('input')({
  clip: 'rect(0 0 0 0)',
  clipPath: 'inset(50%)',
  height: 1,
  overflow: 'hidden',
  position: 'absolute',
  bottom: 0,
  left: 0,
  whiteSpace: 'nowrap',
  width: 1,
});

function App() {
  const [upload, { error, isLoading, data }] = fileAPI.useUploadMutation();

  const handleFileUpload = async (event: React.ChangeEvent<HTMLInputElement>) => {
    const file = event.target?.files?.[0];

    if (!file) {
      // TODO: display error saying that something went wrong during file uploading
      return;
    }

    const fileSize = file?.size ?? 0;
    const fileSizeMB = fileSize / (1024 * 1024);
    const fileSizeMBNumber = +fileSizeMB.toFixed(2);

    if (fileSizeMBNumber > 5) {
      // TODO: Display an error message saying that file size is greater than 5 MB
      return;
    }

    await upload({ file });
  };

  useEffect(() => console.log(error), [error]);
  useEffect(() => console.log(data), [data]);

  return (
    <Button component="label" variant="contained" startIcon={<CloudUpload />} disabled={isLoading}>
      Upload file
      <VisuallyHiddenInput type="file" accept="image/*" onChange={handleFileUpload} />
    </Button>
  );
}

export default App;
