import { mdToPdf } from 'md-to-pdf';

const workDir = process.env.CV_WORK_DIR || process.cwd();

await mdToPdf(
  { path: `${workDir}/README.md` },
  {
    dest: `${workDir}/cv.pdf`,
    stylesheet: [`${workDir}/style.css`],
    launch_options: {
      args: ['--no-sandbox', '--disable-setuid-sandbox'],
      executablePath: process.env.PUPPETEER_EXECUTABLE_PATH,
    },
    pdf_options: {
      format: 'A4',
      margin: { top: '20mm', bottom: '20mm', left: '15mm', right: '15mm' },
      printBackground: true,
    },
  },
);

console.log('Generated cv.pdf');
