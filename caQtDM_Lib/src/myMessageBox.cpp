/*
 *  This file is part of the caQtDM Framework, developed at the Paul Scherrer Institut,
 *  Villigen, Switzerland
 *
 *  The caQtDM Framework is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  The caQtDM Framework is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with the caQtDM Framework.  If not, see <http://www.gnu.org/licenses/>.
 *
 *  Copyright (c) 2010 - 2014
 *
 *  Author:
 *    Anton Mezger
 *  Contact details:
 *    anton.mezger@psi.ch
 */

#include <myMessageBox.h>
#include <QVBoxLayout>
#include <QPushButton>
#include <QDialogButtonBox>

myMessageBox::myMessageBox(QWidget *parent) : QDialog(parent)
{
    thisText = new QTextEdit(this);
    thisText->setReadOnly(true);
    thisText->setTextInteractionFlags(Qt::TextSelectableByMouse);
    thisText->setLineWrapMode(QTextEdit::NoWrap);

    QPushButton *cancelButton = new QPushButton(tr("Close"));

    QDialogButtonBox *buttonBox = new QDialogButtonBox(Qt::Horizontal);
    buttonBox->addButton(cancelButton, QDialogButtonBox::RejectRole);

    connect(buttonBox, SIGNAL(rejected()), this, SLOT(reject()));

    QVBoxLayout *lt = new QVBoxLayout;
    lt->addWidget(thisText);
    lt->addWidget(buttonBox);

    setMinimumSize(300,500);

    setLayout(lt);
}

void myMessageBox::setText(QString strng) const
{
   thisText->setText(strng);
}
